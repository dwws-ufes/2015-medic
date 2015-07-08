package br.ufes.inf.nemo.dwws.domains

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import groovy.transform.ToString

class Patient {

    String name;
    String taxCode;
    Date birthDate;

    static hasMany = [appointments: Appointment]

	String toString(){
		name;
	}
	
    static constraints = {
        name(nullable: false, blank: false, minSize: 1, maxSize: 40)
        taxCode(nullable: false, blank: false, minSize: 11, maxSize: 11)
        birthDate(nullable: false, max: new Date())

    }
	
//	static rdf = [
//		'':'http://xmlns.com/foaf/0.1/Person',
//		'name':'http://xmlns.com/foaf/0.1/name',
//		'birthDate':'http://dbpedia.org/ontology/birthDate'
//	]
	
	static rdf = [
		'':'http://dbpedia.org/resource/Patient',//'http://xmlns.com/foaf/0.1/Person',
		'name':'http://xmlns.com/foaf/0.1/name',
		'birthDate':'http://dbpedia.org/ontology/birthDate',		
		'appointments':'http://www.w3.org/1999/02/22-rdf-syntax-ns#Bag'//'http://purl.org/dc/terms/tableOfContents'
	]
}
