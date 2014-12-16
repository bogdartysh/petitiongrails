import org.petitions.*

class BootStrap {

	def init = { servletContext ->
/*
 update 1:
		Person igor = new Person(firstName:"Ігор", secondName:"Андрійович", lastName: "Артюшенко", email:"artyushenko.igor@facebook.com", title:"Народний депутат України", personalPage:"http://artyushenko.com.ua", imageUrl:"http://www.artyushenko.com.ua/wp-content/uploads/2014/11/igor-artyushenko-logo.png")
		igor.save(flush:true, failOnError:true)
		Addressee kbk = new Addressee(responsiblePerson: igor, title: "Верховна Рада України. Комітет з питань запобігання та протидії корупції", description: "Комітет з питань запобігання та протидії корупції Верховної Ради України", corporateWebAddress:"http://w1.c1.rada.gov.ua/pls/site2/p_komitis")
		kbk.save(flush:true, failOnError:true)
		Addressee sizc= new Addressee(responsiblePerson: igor, title: "Верховна Рада України. Міжфракційне депутатське об’єднання «Запорізька Січ» ", description: "міжфракційне депутатське об’єднання «Запорізька Січ»  Верховної Ради України. Голова -  Петро Ванат, перший заступник - Ігор Артюшенко", corporateWebAddress:"http://rada.gov.ua")
		sizc.save(flush:true, failOnError:true)
		Addressee mdn= new Addressee(responsiblePerson: igor, title: "Верховна Рада України. Міжфракційне депутатське об’єднання «Самооборона Майдану» ", description: "міжфракційне депутатське об’єднання «Самооборона Майдану»  Верховної Ради України. Голова -  Андрій Парубій", corporateWebAddress:"http://rada.gov.ua")
		mdn.save(flush:true, failOnError:true)
		Person bogdan = new Person(firstName:"Богдан", secondName:"Андрійович", lastName: "Артюшенко", email:"bogdan.artyushenko@facebook.com", title:"к.т.н.", personalPage:"https://facebook.com/bogdan.artyushenko")
		bogdan.save(flush:true, failOnError:true)
		Addressee site= new Addressee(responsiblePerson: bogdan, title: "Сайт онлайн пропозицій щодо вдосконалення законодавства до Верховної Ради України.", description: "Ви можете подати Ваші пропозиції щодо власне сайту. Вони проходитимуть звичайну процедуру.", corporateWebAddress:"http://ua-sprava.rhcloud.com", thresholdToBeSearchable:50, thresholdToBeConsidered:100F)
		site.save(flush:true, failOnError:true)


		/*	*/
		Petition.list().each { it ->
			it.numberOfVotes = 0
			it.save()
		}
	}
	def destroy = {
	}
}
