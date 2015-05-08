package br.ufes.inf.nemo.dwws.domains

class Diagnostic {

    String disease;

    static belongsTo = [appointment: Appointment]

	String toString(){
		disease;
	}
    static constraints = {
        disease(nullable: false, blank: false, minSize: 1, maxSize: 40)
    }
}
