Tictactoe::Application.routes.draw do
  get '/game', to: 'game#show', as: 'game'

  post "/play", to: 'game#play'
end
