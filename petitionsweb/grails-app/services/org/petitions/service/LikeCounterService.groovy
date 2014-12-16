package org.petitions.service

import grails.transaction.Transactional
import org.petitions.*

@Transactional
class LikeCounterService {

    def getSharesQty(Petition petition) {
		String url = "ua-sprava.rhcloud.com/petition/index?id=" + petition.id;
		
		
		
		

    }
}
