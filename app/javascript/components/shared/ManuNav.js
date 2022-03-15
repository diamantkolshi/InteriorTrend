import React from 'react';
import { Inertia } from "@inertiajs/inertia";

const ManuNav = ({name}) => {
  return (
    <div className="col-lg-3 col-xl-2 mb-5">
      <div className="list-group shadow">
        <a
          className="list-group-item"
          href="/patients/1"
          style={{overflowX: 'hidden'}}>
          Übersicht
        </a>

        <a
          className="list-group-item active"
          href="/patients/1/edit"
          style={{overflowX: 'hidden'}}>
          Stammdaten
        </a>

        <a
          className="list-group-item"
          href="/patients/1/monitoring_goals"
          style={{overflowX: 'hidden'}}>
          Grenzwerte
        </a>

        <a
          className="list-group-item"
          href="/patients/1/documents"
          style={{overflowX: 'hidden'}}>
          Dokumente

          <span className="badge badge-danger float-right">9+</span>
        </a>

        <a
          className="list-group-item"
          href="/patients/1/measurements"
          style={{overflowX: 'hidden'}}>
          Messungen
        </a>

        <a
          className="list-group-item"
          href="/patients/1/messages"
          style={{overflowX: 'hidden'}}>
          Nachrichten

          <span className="badge badge-danger float-right">9+</span>
        </a>

        <a
          className="list-group-item"
          href="/patients/1/medications"
          style={{overflowX: 'hidden'}}>
          Medikationsplan
        </a>

        <a
          className="list-group-item"
          href="/patients/1/medication_intakes"
          style={{overflowX: 'hidden'}}>
          Medikamenteneinnahmen
        </a>

        <a
          className="list-group-item"
          href="/patients/1/medical_contacts"
          style={{overflowX: 'hidden'}}>
          Kontakte
        </a>

        <a
          className="list-group-item"
          href="/patients/1/diagnoses"
          style={{overflowX: 'hidden'}}>
          Diagnosen
        </a>

        <a
          className="list-group-item"
          href="/patients/1/notes"
          style={{overflowX: 'hidden'}}>
          Dokumentation
        </a>
      </div>
    </div>
  )
}

export default ManuNav;
