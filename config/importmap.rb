# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
# config/importmap.rb
pin 'new_order', to: 'new_order.js'
pin 'cocoon', to: 'https://cdn.jsdelivr.net/npm/@nathanvda/cocoon@1.2.14/cocoon.min.js'
pin 'jquery', to: 'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js', preload: true
