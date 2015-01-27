package org.petitions.service

import grails.transaction.Transactional
import org.petitions.*
import grails.plugins.rest.client.RestBuilder

@Transactional
class LikeCounterService {
	def rest  = new grails.plugins.rest.client.RestBuilder()
	//based on http://stackoverflow.com/questions/5699270/how-to-get-share-counts-using-graph-api/19119580#19119580 and http://stackoverflow.com/questions/8853342/how-to-get-google-1-count-for-current-page-in-php
	
	
	def getFBLikes(String url) {
		try {
			return rest.get( "https://api.facebook.com/method/links.getStats?format=json&urls=" + url).json.total_count[0]
		} catch(e) {
			print e
			return 0
		}
	}


	def getTWLikes(String url) {
		try {
			def respFB = rest.get( "https://api.facebook.com/method/links.getStats?format=json&urls=" + url)
			def respTw = rest.get( "http://urls.api.twitter.com/1/urls/count.json?url=" + url)
			respTw.json.count
		} catch(e) {
			print e
			return 0
		}
	}

	def getGPLikes(String url) {
		try {
			def jsonGo = rest.get( 'https://plusone.google.com/_/+1/fastbutton?url=http://' + url)
			def index = jsonGo.text.indexOf("aggregateCount")
			def goLast = jsonGo.text.substring(index, index+ 100)
			
			def remnant = goLast.substring(goLast.indexOf(">") + 1, goLast.indexOf("<"))
			remnant.toInteger()
		} catch(e) {
			print e
			return 0
		}
	}

	
	
	
	
	def updateSharesQty(Petition petition) {
		def url = "ua-sprava.rhcloud.com/petition/index/" + petition.id
		def likes = getFBLikes(url) + getTWLikes(url) + getGPLikes(url)
		def wwwnewurl = "www.propozycija.org.ua/petition/index/" + petition.id
		likes += getFBLikes(wwwnewurl) + getTWLikes(wwwnewurl) + getGPLikes(wwwnewurl)
		
		if (!petition.numberOfShares || petition.numberOfShares < likes) {
			print petition 
			print  "   " + likes
			petition.numberOfShares =  likes
			petition.save()
		}
	}
}
