# SINGLE-RESPONSABILITY (SRP)
# Single Responsability states: A class should have one and only one reason to change, meaning that a class should have only one job

class DealProcessor
  def initialize(deals)
    @deals = deals
  end

  def process 
    @deals.each do |deal|
      Commission.create(deal: deal, amount: calculate_commission)
      mark_deal_processed
    end
  end

  private

  def mark_deal_processed
    @deal.processed = true
    @deal.save!
  end

  def calculate_commission
    @deal.dollar_amount * 0.05
  end
end

# We can do a quicki refactor and get our code in compliance with the Single Responsability Principle.

class DealProcessor
  def initialize(deals)
    @deals = deals
  end

  def process 
    @deals.each do |deal|
      # Commission.create(deal: deal, amount: calculate_commission)
      mark_deal_processed
      CommissionCalculator.new.create_commission(deal)
    end
  end

  private

  def mark_deal_processed
    @deal.processed = true
    @deal.save!
  end
end

class CommissionCalculator
  def create_commission(deal)
    Commission.create(deal: deal, amount: deal.dollar_amount * 0.05)
  end
end

# OPEN/CLOSED PRINCIPLES

# Open for extension but closed for Modification.
# This tells us we should strive for modular designs that make it possible for us to change the behavior of the system without making modificatiions to the classes themselves. This is generally achieved through the use of patterns such as strategy pattern. Let's look at an example of some code that is violating the Open/Closed Principle:

class UsageFileParser
  # def initialize(client, usage_file)
  #   @client = client
  #   @usage_file = usage_file
  # end

  def initialize(client, parser)
    @client = client
    @parser = parser
  end

  def parse
    # case @client.usage_file_format
    # when :xml
    #   parse_xml
    # when :csv
    #   parse_csv
    # end
    parser.parse(usage_file)
    @client.last_parse = Time.now
    @client.save!

    @client.last_parse = Time.now
    @client.save!
  end

  private

  # def parse_xml
  #   # parse xml
  # end

  class XmlParser
    def parse(usage_file)
      # parse xml
    end
  end

  # def parse_csv
  #   # parse csv
  # end

  class CsvParser
    def parse(usage_file)
      # parse csv
    end
  end
end



# Liskov Substitution Principle
# Liskov's principle tends to be the most diffuclt to understance. The principle states that you should be able to replace any instances of a parent class with an instance of one of its children without creating any unexpected or incorrect beahviors

class Rectangle
  def set_height(height)
    @height = height
  end

  def set_width(width)
    @width = width
  end
end

class Square < Rectangle
  def set_height(height)
    super(height)
    @width = height
  end

  def set_width(width)
    super(width)
    @height = width
  end
end


# Interface Segregation Principle
class Test {
  let questions: [Question]
  init(testQuestions: [Question]) {
    questions = testQuestions
  }

  func answerQuestion(questionNumber: Int, choice: Int) {
    questions[questionNumber].answer(choice)
  }

  func gradeQuestion(questionNumber: Int, correct: Bool) {
    question[questionNumber].grade(correct)
  }
}

class User {
  func takeTest(test: Test) {
    for question in test.questions {
      test.answerQuestion(question.number, arc4random(4))
    }
  }
}

# GOOD
protocol QuestionAnswering {
  var questions: [Question] { get }
  func answerQuestion(questionNumber: Int, choice: Int)
}

class Test: QuestionAnswering {
  let questions: [Question]
  init(testQuestions: [Question]) {
    self.questions = testQuestions
  }

  func answerQuestion(questionNumber: Int, choice: Int) {
    questions[questionNumber].answer(choice)
  }

  func gradeQuestion(questionNumber: Int, correct: Bool) {
    question[questionNumber].grade(correct)
  }
}

class User {
  func takeTest(test: QuestionAnswering) {
    for question in test.questions {
      test.answerQuestion(question.number, arc4random(4))
    }
  }
}



# Dependency Inversion Principle
class UsageFileParser
  def initialize(client, parser)
    @client = client
    @parser = parser
  end

  def parse(usage_file)
    parser.parse(usage_file)
    @client.last_parse = Time.now
    @client.save!
  end
end

class XmlParser
  def parse(usage_file)
    # parse xml
  end
end

class CsvParser
  def parse(usage_file)
    # parse csv
  end
end

