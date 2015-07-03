package br.ufes.inf.nemo.dwws.domains

class Diagnostic {

    String disease;

    static belongsTo = [appointment: Appointment]
	static hasMany = [prescriptions:Prescription]

	String toString() {
		disease;
	}
	
    static constraints = {
        disease(nullable: false, blank: false, minSize: 1, maxSize: 40)
    }
	
	static rdf = [
		'':'http://xmlns.com/foaf/0.1/Document',
		'disease':'http://bio2rdf.org/drugbank_vocabulary:${medicine}'
	]
	
	static rdfdbpedia = [
		'':'http://xmlns.com/foaf/0.1/Document',
		'disease':'http://dbpedia.org/resource/${disease.toLowerCase().capitalize().replaceAll(~/\b/, "_")}'
	]
}
