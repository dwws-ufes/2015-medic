package br.ufes.inf.nemo.dwws.domains

class Appointment {

    Date date;

    static belongsTo = [patient: Patient]
    static hasMany = [diagnostics: Diagnostic, prescriptions: Prescription]

    String toString() {
        return "Consulta "+this.id;

    }

    static constraints = {
        date(nullable: false)
    }

}
