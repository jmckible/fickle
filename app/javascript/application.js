// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import '@hotwired/turbo-rails'
import { Application } from "@hotwired/stimulus"

import BallotController from "./controllers/ballot_controller"

window.Stimulus = Application.start()
Stimulus.register("ballot", BallotController)
