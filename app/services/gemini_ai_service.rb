# app/services/gemini_ai_service.rb
require "gemini-ai"

class GeminiAiService
  # ✅ ENV variable का नाम GEMINI_API_KEY होना चाहिए
  unless ENV["GEMINI_API_KEY"].present?
    Rails.logger.warn "GEMINI_API_KEY environment variable is NOT set!"
  end

  def initialize
    # ✅ Client को initialize करते समय ENV['GEMINI_API_KEY'] का उपयोग करें
    @client = Gemini::Client.new(api_key: ENV["GEMINI_API_KEY"])
    @model = "gemini-2.5-flash"
  rescue StandardError => e
    Rails.logger.error "Gemini Client Initialization Error: #{e.message}"
    @client = nil
  end

  # अब यह सीधे final_prompt (Controller से) को accept करता है
  def query_post_for_code(final_prompt)
    return "AI client configuration error. Check GEMINI_API_KEY." unless @client

    Rails.logger.info "Sending prompt to Gemini: #{final_prompt}"

    begin
      response = @client.generate_content(
        model: @model,
        contents: final_prompt
      )

      # रिस्पॉन्स में केवल टेक्स्ट content वापस करें
      response.text
    rescue StandardError => e
      Rails.logger.error "Gemini API Call Error: #{e.message}"
      "Error: Could not get a response from the AI. Details: #{e.message}"
    end
  end
end
