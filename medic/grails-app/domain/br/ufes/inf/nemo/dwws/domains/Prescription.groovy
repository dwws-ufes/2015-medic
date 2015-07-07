package br.ufes.inf.nemo.dwws.domains

class Prescription {

    String medicine

    static belongsTo = [diagnostic: Diagnostic]

	String toString(){
		medicine;
	}
    static constraints = {
        medicine(nullable: false, blank: false)
    }
	
	static transients = ['drug', 'dosage', 'indication']
	
	static rdf = [
		"":"http://dbpedia.org/ontology/Medicine",
		"medicine":'http://www.w3.org/1999/02/22-rdf-syntax-ns#label'//"http://bio2rdf.org/drugbank_vocabulary:\$medicine"
		//'uri':'http://localhost:8080/medic/prescription/',
		//'medicine':'http://bio2rdf.org/drugbank_vocabulary:${medicine}'
	]
}
