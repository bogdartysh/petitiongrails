package org.petitions.service

import grails.transaction.Transactional
import org.petitions.*
import grails.plugins.rest.client.RestBuilder

@Transactional
class LikeCounterService {
	def rest  = new grails.plugins.rest.client.RestBuilder()
	//based on http://stackoverflow.com/questions/5699270/how-to-get-share-counts-using-graph-api/19119580#19119580 and http://stackoverflow.com/questions/8853342/how-to-get-google-1-count-for-current-page-in-php
	def updateSharesQty(Petition petition) {
		def url = "ua-sprava.rhcloud.com/petition/index/?id=" + petition.id
		//def url = "http://gazeta.zn.ua/macrolevel/kak-ostanovit-devalvacionnyy-tornado-_.html"
		def respFB = rest.get( "https://api.facebook.com/method/links.getStats?format=json&urls=" + url)	
		print respFB.json
		petition.numberOfShares = respFB.json.total_count[0]



		/*
		 def respTw = rest.get( "http://urls.api.twitter.com/1/urls/count.json?url=" + url)
		 def respPlus = rest.get( "ua-sprava.rhcloud.com%2Fpetition%2Findex%3Fid%3D" + url)
		 /*
		 * 
		 def httpFB = new HTTPBuilder("https://api.facebook.com/")
		 def jsonFB = httpFB.get( path : '/method/links.getStats', query : [format:'json', urls:url] )
		 println jsonFB
		 def httpTw = new HTTPBuilder("http://urls.api.twitter.com/")
		 def jsonTw = httpTw.get( path : '/1/urls/count.json', query : [url:url] )
		 println jsonTw
		 def httpGo = new HTTPBuilder("https://plusone.google.com")
		 def jsonGo = httpGo.get( path : '/_/+1/fastbutton', query : [url:url] )
		 println jsonGo
		 function getTweets($url){
		 $json = file_get_contents( "http://urls.api.twitter.com/1/urls/count.json?url=".$url );
		 $ajsn = json_decode($json, true);
		 $cont = $ajsn['count'];
		 return $cont;
		 }
		 function getPins($url){
		 $json = file_get_contents( "http://api.pinterest.com/v1/urls/count.json?callback=receiveCount&url=".$url );
		 $json = substr( $json, 13, -1);
		 $ajsn = json_decode($json, true);
		 $cont = $ajsn['count'];
		 return $cont;
		 }
		 function getFacebooks($url) { 
		 $xml = file_get_contents("http://api.facebook.com/restserver.php?method=links.getStats&urls=".urlencode($url));
		 $xml = simplexml_load_string($xml);
		 $shares = $xml->link_stat->share_count;
		 $likes  = $xml->link_stat->like_count;
		 $comments = $xml->link_stat->comment_count; 
		 return $likes + $shares + $comments;
		 }
		 */





	}
}
