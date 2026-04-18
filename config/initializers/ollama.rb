# config/initializers/ollama.rb
OLLAMA_CLIENT = Ollama.new(
  credentials: { address: 'http://localhost:11434' },
  options: { server_sent_events: true }
)
