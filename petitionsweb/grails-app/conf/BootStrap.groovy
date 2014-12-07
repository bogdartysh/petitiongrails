import org.petitions.Addressee
import org.petitions.Person

class BootStrap {

    def init = { servletContext ->
		Person igor = Person.get(1)
		Addressee kbk = new Addressee(responsiblePerson: igor, title: "Верховна Рада України. Комітет з питань запобігання та протидії корупції", description: "Комітет з питань запобігання та протидії корупції Верховної Ради України", corporateWebAddress="http://w1.c1.rada.gov.ua/pls/site2/p_komitis")
		kbk.save(flush:true, failOnError:true)
		 
		/*
		Person igor = new Person(firstName:"Ігор", secondName:"Андрійович", lastName: "Артюшенко", email:"artyushenko.igor@facebook.com", title:"Народний депутат України", personalPage:"http://artyushenko.com.ua", imageUrl:"http://www.artyushenko.com.ua/wp-content/uploads/2014/11/igor-artyushenko-logo.png")
		igor.save(flush:true, failOnError:true)
		/**
		 * Комітет з питань запобігання та протидії корупції
		 */
		
		
		
    
    }
    def destroy = {
    }
}
