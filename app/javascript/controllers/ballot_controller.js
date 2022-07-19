import { Controller } from '@hotwired/stimulus'

export default class BallotContorller extends Controller {

  static targets = ['choices', 'rankings']

  connect() {
    this.choices.forEach((c) => {
      c.draggable = true
      c.ondragstart = (event) => {
        event.dataTransfer.setData('application/drag-key', event.target.dataset.ballotChoiceId)
      }
    })

    this.rankingsTarget.ondragover = (event) => {
      event.preventDefault()
      event.stopPropagation()
    }


    this.rankingsTarget.ondrop = (event) => {
      event.preventDefault()
      event.stopPropagation()
      this.addRanking(event)
    }
  }

  get choices() {
    return this.choicesTarget.querySelectorAll('li')
  }

  getChoiceById(id) {
    return document.querySelector(`[data-ballot-choice-id="${id}"]`)
  }

  undo(event) {
    this.choicesTarget.appendChild(event.currentTarget.closest('li'))
  }

  addRanking(choiceId) {
    const choice = this.getChoiceById(event.dataTransfer.getData('application/drag-key'))

    if (choice.parentElement === this.choicesTarget) {
      this.rankingsTarget.appendChild(choice)
    } else if (choice.parentElement === this.rankingsTarget && event.target.closest('li')){
      const dropTarget = event.target.closest('li')
      switch (dropTarget.compareDocumentPosition(choice)) {
      case Node.DOCUMENT_POSITION_PRECEDING:
        dropTarget.insertAdjacentElement('afterend', choice)
        break
      case Node.DOCUMENT_POSITION_FOLLOWING:
        dropTarget.insertAdjacentElement('beforebegin', choice)
        break
      }
    }


  }
}
