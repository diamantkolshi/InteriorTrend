import React from 'react';
import { Inertia } from "@inertiajs/inertia";

const HeaderNav = ({name}) => {
  return (
    <div id="content-top-bar">
      <nav>
        <ol class="breadcrump breadcrumb-title">
          <li class="breadcrumb-item">#1 | Mustermann, Max | 60 Jahre | Männlich </li>
        </ol>
      </nav>
      <div class="nav-buttons">
        <a class="btn btn-secondary" data-controller="modal-form" href="/patients/1/messages/new" data-remote="true">
          <i class="fas fa-envelope "></i>
          Nachricht schreiben
        </a>
        <a class="btn btn-secondary ml-2" data-controller="modal-form" href="/patients/1/measurements/new" data-remote="true">
          <i class="fas fa-stethoscope "></i>
          Messung anfordern
        </a>
      </div>
    </div>
  )
}

export default HeaderNav;
