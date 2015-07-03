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
		'':'http://xmlns.com/foaf/0.1/Document',
		'medicine':'http://bio2rdf.org/drugbank_vocabulary:${medicine}'
	]
}
