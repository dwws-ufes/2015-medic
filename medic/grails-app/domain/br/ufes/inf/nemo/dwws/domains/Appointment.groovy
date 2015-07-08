package br.ufes.inf.nemo.dwws.domains

class Appointment {

    Date date;

    static belongsTo = [patient: Patient]
    static hasMany = [diagnostics: Diagnostic]

    String toString() {
        return "Consulta "+this.id;

    }

    static constraints = {
        date(nullable: false)
    }	
	
	static rdf = [
		'':'http://dbpedia.org/ontology/Meeting',
		'date':'http://dbpedia.org/ontology/startDate'
	]
	
}
