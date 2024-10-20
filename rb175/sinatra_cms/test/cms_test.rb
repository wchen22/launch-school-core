ENV["RACK_ENV"] = "test" # This environment variable lets Sinatra and Rack know if code is being tested and whether Sinatra should start a web server or not

require "minitest/autorun"
require "rack/test" # Will need to add rack-test gem to Gemfile, not built in Sinatra

require_relative "../cms"
require "fileutils"

class CMSTest < Minitest::Test
  include Rack::Test::Methods # Mix in this module to gain access to useful testing helper methods, 
  
  #which expect a method called app to exist and return an instance of a Rack application when called
  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def app 
    Sinatra::Application
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { username: "admin" } }
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"
    assert_includes last_response.body, '<button type="delete">'
  end

  def test_viewing_text_document
    create_document "history.txt", "1993 - Yukihiro"
    get "/history.txt"

    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "1993 - Yukihiro"
  end

  def test_nonexistent_document_request
    get "/notafile.txt"

    assert_equal 302, last_response.status
    assert_equal "File notafile.txt not found", session[:message]
    get last_response["Location"]

    assert_equal 200, last_response.status
    assert_includes last_response.body, "notafile.txt"

    get "/"
    refute_includes last_response.body, "notafile.txt"
  end

  def test_viewing_markdown_document
    create_document "about.md", "# Project Title

    ## Introduction
    A brief introduction to the project"

    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Project"
  end

  def test_edit
    create_document "history.txt"
    
    get "/history.txt/edit", {}, admin_session

    assert_equal 200, last_response.status
    #assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response["Content-Type"], "text/html"
    assert_includes last_response.body, "</form>"
  end

  def test_updating_document
    post "/changes.txt", {content: "new content"}, admin_session

    assert_equal 302, last_response.status
    assert_equal "changes.txt has been updated.", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_view_new_document_form
    get "/new", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "Add a document"
    assert_includes last_response.body, "</form>"
  end

  def test_create_new_document
    get "/", {}, admin_session
    post "/new", document_name: "new_document.txt"

    assert_equal 302, last_response.status
    assert_equal "new_document.txt has been created.", session[:message]

    get last_response["Location"]
    assert_includes last_response.body, "new_document.txt</a>"
  end

  def test_create_document_with_blank_filename
    post "/new", {document_name: " "}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "cannot be blank"
    assert_includes last_response.body, "Add a document:"
  end

  def test_delete_document
    create_document("to_be_deleted.txt")

    post "/to_be_deleted.txt/delete", {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "to_be_deleted.txt has been deleted", session[:message]
    
    get "/"
    get "/"
    refute_includes last_response.body, "to_be_deleted.txt"
  end

  def test_signin_form
    get "/users/signin"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="signin")
  end

  def test_signin
    post "/users/signin", username: "admin", password: "secret"
    assert_equal 302, last_response.status
    assert_equal "Welcome!", session[:message]
    assert_equal "admin", session[:username]
  end

  def test_signin_with_bad_credentials
    post "/users/signin", username: "guest", password: "shhhh"
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_signout
    get "/", {}, {"rack.session" => { username: "admin" } }
    assert_includes last_response.body, "Signed in as admin"

    post "/users/signout"
    assert_equal "You have been signed out.", session[:message]

    get last_response["Location"]
    assert_nil session[:username]
    assert_includes last_response.body, "Sign In"
  end

  def test_visit_edit_while_signed_out
    create_document "document.txt"

    get "/document.txt/edit"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_updating_document_signed_out
    post "/changes.txt", {content: "new content"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_view_new_document_form_signed_out
    get "/new"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_create_new_document_signed_out
    post "/create", {filename: "new_doc.txt"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_delete_document_signed_out
    create_document("test.txt")

    post "/test.txt/delete"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end
end