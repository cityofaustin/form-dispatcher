class Submission < ApplicationRecord
  require "uri"
  require "net/http"
  
  def self.dispatch(destination, submission)
    endpoint = Submission.endpoint_for(destination, Rails.env)
    res = Net::HTTP.post_form(endpoint, 'q' => submission.to_json)
    return res
  end
  
  def self.endpoint_for(destination, environment)
      case environment
        when "development"
          case destination
            when "email"
              uri = URI('http://localhost:3002')
          end
        when  "production"
          case destination
            when "email"
              uri = URI('https://coa-test-form-email.herokuapp.com/')
          end
      end
      return uri
    end

end
