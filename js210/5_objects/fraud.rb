
INPUT_HEADERS = [:timestamp, :unique_code, :amount, :card_number, :merchant]
RULE_HEADERS = [:timestamp, :field_name, :field_value]

def process_input(headers, inputs)
  inputs.map { |input| headers.zip(input.split(",")).to_h }
        .sort_by { |element| element[:timestamp].to_i }
end

def approval_result(transaction, rules)
  active_rules = rules.select do |rule|
    rule[:field_value] == transaction[rule[:field_name].to_sym] &&
    rule[:timestamp].to_i <= transaction[:timestamp].to_i
  end

  merchant_rules, card_no_rules = active_rules.partition do |rule|
    rule[:field_name] == "merchant"
  end

  decision = (merchant_rules.size.odd? || 
              card_no_rules.size.odd?) ? "REJECTED" : "APPROVED"

  output_components = [
   transaction[:timestamp],
   transaction[:unique_code],
   transaction[:amount],
   decision
  ]

  output_components.join(" ")
end

def generate_report(inputs, rules)
  transactions = process_input(INPUT_HEADERS, inputs)
  rules = process_input(RULE_HEADERS, rules)

  output = transactions.map do |transaction|
    approval_result(transaction, rules)
  end

  output.join("\n")
end


  # inputs ["10,R2,500.00,4242111111111111,a_corp", "5,R1,5.60,4242424242424242,bobs_burgers", "25,R3,600.00,4242111111111111,a_corp", "30,R4,5.60,4242424242424242,bobs_burgers", "45,R5,5.60,4242424242424242,bobs_burgers"]

  # transform inputs, rules into hashes
  # rules[0] -? timestamp: criteria_field: field_value

    # def reject_or_approve(transaction, rules) 
     # transaction -> {timestamp: 10, unique_code: "R2", amount: "500.00", card_number: "12541253...", merchant: "bobs_burgers"}


     # rules -> ["1,merchant,bobs_burgers", 
     #  "20,card_number,4242111111111111",
     #  "25,merchant,bobs_burgers", 
     #  "40,merchant,bobs_burgers"]

      # filter rules (iterate) |rule|
        # true if field_value is transaction[criteria_field.to_sym] && rule timestamp is earlier than transaction timestamp
      # RESULT: an array of rules where merchant or card_no match the transaction
        # separate into merchant and card_no rulesets
      
      # If either count of merchant and card_no rulesets count is odd, REJECT. 




input_1 = ["10,R2,500.00,4242111111111111,a_corp",
          "5,R1,5.60,4242424242424242,bobs_burgers", 
          "25,R3,600.00,4242111111111111,a_corp",
          "30,R4,5.60,4242424242424242,bobs_burgers", 
          "45,R5,5.60,4242424242424242,bobs_burgers"]
rules_1 = ["1,merchant,bobs_burgers", "20,card_number,4242111111111111", "25,merchant,bobs_burgers", "40,merchant,bobs_burgers"]
expected_output_1 = "5 R1 5.60 REJECTED\n10 R2 500.00 APPROVED\n25 R3 600.00 REJECTED\n30 R4 5.60 APPROVED\n45 R5 5.60 REJECTED"

p generate_report(input_1, rules_1) == expected_output_1





# # Round 1 was the same as below but with no fraud rules
# # Below is the extension / round 2

# # Certain colleagues upstairs have let us know that our policy of approving every Authorization Request is frowned upon by our investors. Luckily, they informed us of a separate system that our data science department built which can detect Authorization Requests that are fraudulent. With fraud, the data scientists say, nothing is set in stone. The criteria for fraud change constantly, so their system develops new Fraud Rules all the time. They’ve given us access to their system’s stream of Fraud Rules, in the following format:
 
# # time,field,value
# # 1,merchant,bobs_burgers
# # 20,card_number,4242111111111111
 
# # The first Fraud Rule indicates: "from 1 second onward, any Authorization Request with merchant of bobs_burgers is fraudulent."
# # The second indicates: "from 20 seconds onward, any Authorization Request with card_number of 4242111111111111 is fraudulent."
# # Once a Fraud Rule is introduced, it is applicable in perpetuity. A new Fraud Rule cannot be applied to a previous request.
 
# # Example:
 
# # TIME EVENT
# # *      5 fraud rule A    <-- can apply to R3, R4, and R5
# # |     10 request R3
# # |     20 request R4
# # | *   30 fraud rule B    <-- can only apply to R5
# # | |   40 request R5
# # v v * 45 fraud rule C    <-- does not apply to R3, R4, R5
 
# # Integrate Fraud Rule data: REJECT fraudulent Authorization Requests. For the same input as before:
 
# # timestamp_seconds,unique_id,amount,card_number,merchant
# # 5,R1,5.60,4242424242424242,bobs_burgers
# # 10,R2,500.00,4242111111111111,a_corp
 
# # And the fraud rule input:
 
# # time,field,value
# # 1,merchant,bobs_burgers
# # 20,card_number,4242111111111111
 
# # The expected report:
 
# # 5 R1 5.60 REJECT
# # 10 R2 500.00 APPROVE
# # Enter your code here.

# # return array of tuples of timestamp and rule,
# # sorted by timestamp
# # FIELD_TO_INDEX = {"timestamp": 0, "unique_id": 1, "amount": 2, "card_number": 3, "merchant": 4}

# # def check_approval(request, active_rules) -> str:
# #     for (timestamp, rule_field, value) in active_rules:
# #         field_index = FIELD_TO_INDEX[rule_field]
# #         if request[field_index] == value:
# #             return "REJECTED"
# #     return "APPROVED"

# # def generate_report(requests: [], rules: []):
# #     # sort requests and rules by time
# #     # go line by line through the requests
# #     # parse out the fields we want
# #     # return them joined by newline breaks
# #     output_strings = []
# #     requests.sort(key = lambda request: int(request.split(",")[0]))
# #     requests = [request.split(",") for request in requests]
# #     rules.sort(key = lambda rule: int(rule.split(",")[0]))
# #     rules = [rule.split(",") for rule in rules]
# #     active_rules = []
# #     current_rule_index = 0
# #     for request in requests:
# #         print("working on:", request)
# #         # update active rules
# #         # current_time = int(request[0])
# #         # while int(rules[current_rule_index][0]) < current_time:
# #         #     active_rules.append(rules[current_rule_index])
# #         #     print("updated rules", active_rules)
# #         #     if current_rule_index < len(rules) - 1:
# #         #         current_rule_index += 1
# #         # check if the request is approved
# #         approval_status = check_approval(request, rules)
# #         print("approval_status", approval_status)
# #         output_string = " ".join([request[0], request[1], request[2], approval_status])
# #         print("generated output:", output_string)
# #     final_output = "\n".join(output_strings)
# #     return final_output
    

# def generate_report(transactions, rules)
#   transactions_fields = [:timestamp, :unique_id, :amount, :card_num, :merchant]
#   rules_fields = [:timestamp, :field, :value]

#   transactions = transactions.map{ |string| (transactions_fields.zip(string.split(','))).to_h}
#   rules = rules.map{ |string| (rules_fields.zip(string.split(','))).to_h}
  
#   rules.each do |rule|
#     rule[:timestamp] = rule[:timestamp].to_i
#   end

#   rules.sort_by! { |rule| rule[:timestamp] }

#   transactions.each do |transaction|
#     transaction[:timestamp] = transaction[:timestamp].to_i
#     transaction[:amount] = transaction[:amount].to_i
#   end
#   transactions.sort_by! { |transaction| transaction[:timestamp]}

#   transactions.each do |transaction|
#     output = [transaction[:timestamp], transaction[:unique_id], transaction[:amount]]
#     timestamp = transaction[:timestamp]
#     rules_to_check = rules.filter { |rule| rule[:timestamp] <= timestamp}

#     rules_to_check.each do |rule|
#       if rule[:field] == "card_number"
#         if transaction[:card_num] == rule[:value]
#           output << "REJECT"
#         end
#       elsif rule[:field] == "merchant"
#         if transaction[:merchant] == rule[:value]
#           output << "REJECT"
#         end
#       end
#     end

#     output << "APPROVE" if output.length == 3
#     p output
#   end
#   # Inputs
#     # array of transactions as strings, which comma separated represent: [timestamp, unique_id, amount, card_number, merchant]
#     # array of rules as strings, comma separated represents [timestamp, field_to_check, value_to_reject]
#   # Outputs
#     # Generate a report with a line for each transaction (timestamp, unique_id, amount, REJECT/APPROVE)
#   # Data Structure
#     # Output is a map of the transactions array
#       # 4242111111111111,a_corp => REJECT / APPROVE
#       # card_num, merchant_name => ??? => REJECT/APPROVE
#         # Input: card_num, merchant_name
#           # For each transaction
#             # I want to iterate over all rules with the same time or later
#               # Filter rules based on timestamp criteria, then iterate
#               # If the rule[field_to_check] is card_num
#                 # Reject If transaction[card_number] == rule[value]
#               # if rule[ftc] is merchant
#                 # Reject If transaction[merchant] == rule[value]
#             # After iterating over all rules with no rejections, approve
#     # Rules [{timestamp:timestamp, field_to_check: "merchant"/"card_number", value:value}, ...]
#     # 


# end

# input_1 = ["10,R2,500.00,4242111111111111,a_corp", "5,R1,5.60,4242424242424242,bobs_burgers", "25,R3,600.00,4242111111111111,a_corp"]
# rules_1 = ["1,merchant,bobs_burgers", "20,card_number,4242111111111111"]
# expected_output_1 = "5 R1 5.60 REJECT\n10 R2 500.00 APPROVE\n\25 R3 600.00 REJECT"
# actual_output_1 = generate_report(input_1, rules_1)
# # print("actual output", actual_output_1)
# print("expected output", expected_output_1)
# puts (actual_output_1 == expected_output_1)