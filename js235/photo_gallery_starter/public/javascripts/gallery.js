import templates from './templates.js';

let photos;

class Slideshow {
  constructor() {
    this.slideshow = document.getElementById('slideshow');
    let slides = this.slideshow.querySelectorAll('figure');
    this.firstSlide = slides[0];
    this.lastSlide = slides[slides.length - 1];
    this.currentSlide = this.firstSlide;
    this.bind(); // set up event handlers on the buttons
  }
  // when i click next:
    // the 'next' slide must be found
      // transitioned in
      // current slide transitioned out
      // render photo info and comments for idx

  prevSlide () {
    // fade out the current one, fade in the next one
  }

  nextSlide(event) {
    event.preventDefault();
    console.log('next');

    this.currentSlide.classList.add('inactive');
    if (this.currentSlide === slides[slides.length - 1]) {
      this.currentSlide = this.currentSlide.parentElement.firstElementChild;
    } else {
      this.currentSlide = this.currentSlide.nextSibling;
    }
    this.currentSlide.classList.add('active'); 
    // photos = photos.slice(1).concat(photos[0]);
    // renderPhotos();
    // renderPhotoInformation(photos[0].id);

    //slides.innerHTML = templates.photos(photos);

  }
  // nextSlide
  // changeSlide

  bind() {
    let prevButton = this.slideshow.querySelector('a.prev');
    let nextButton = this.slideshow.querySelector('a.next');

    prevButton.addEventListener('click', event => { // prevSlide
      event.preventDefault();
      console.log('prev')
    });

    nextButton.addEventListener('click', event => this.nextSlide(event));

  }

}

async function fetchPhotos() {
  let response = await fetch('/photos');
  return response.json();
}

function renderPhotos() {
  let slides = document.getElementById('slides');
  slides.innerHTML = templates.photos(photos);
}

function renderPhotoInformation(idx) {
  let photo = photos.find(item => item.id === idx);
  let photoInfo = document.getElementById('information');
  photoInfo.innerHTML = templates.photoInformation(photo);
}

async function fetchCommentsFor(idx) {
  let comments = await fetch(`/comments?photo_id=${idx}`);
  return comments.json();
}

function renderComments(comments) {
  let commentsList = document.querySelector('#comments ul');
  commentsList.innerHTML = templates.comments(comments);
}

async function main() { // fetch the photos, get the active photo, render photos, render active phot info
  photos = await fetchPhotos();
  let activePhotoId = photos[0].id;
  renderPhotos();
  renderPhotoInformation(activePhotoId);

  let comments = await fetchCommentsFor(activePhotoId);
  renderComments(comments);

  let slideshow = new Slideshow();
}


document.addEventListener('DOMContentLoaded', main);


