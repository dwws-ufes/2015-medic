package br.ufes.inf.nemo.dwws.domains

class Prescription {

    String medicine;

    static belongsTo = [appointment: Appointment]

	String toString(){
		medicine;
	}
    static constraints = {
        medicine(nullable: false, blank: false)
    }
}
