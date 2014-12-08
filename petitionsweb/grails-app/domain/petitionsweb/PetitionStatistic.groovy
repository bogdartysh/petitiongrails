package petitionsweb

import org.petitions.Petition

class PetitionStatistic {

	static constraints = {
	}

	Petition petition
	Date createdOn = new Date()
	Integer votesDiff = 0
	Integer  votesTotal = 0
}
