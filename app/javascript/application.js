// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import Rails from '@rails/ujs'
Rails.start()

import { Application } from "@hotwired/stimulus"

import BallotController from "./controllers/ballot_controller"

window.Stimulus = Application.start()
Stimulus.register("ballot", BallotController)
