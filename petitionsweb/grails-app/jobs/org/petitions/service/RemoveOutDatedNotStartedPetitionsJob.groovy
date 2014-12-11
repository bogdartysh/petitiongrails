package org.petitions.service



class RemoveOutDatedNotStartedPetitionsJob {
    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }

    def execute() {
        // execute job
    }
}
