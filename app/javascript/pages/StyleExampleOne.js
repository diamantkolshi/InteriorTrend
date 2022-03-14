import React from 'react';
import { Inertia } from "@inertiajs/inertia";
import { Container } from "@material-ui/core";
import { Button, ButtonGroup } from "@material-ui/core";
import { TextField } from "@material-ui/core";
import { Paper, Box } from "@material-ui/core";

const StyleExampleOne = ({name}) => {
  return (
    <>
      <div id="content-top-bar">
        <nav>
          <ol class="breadcrump breadcrumb-title">
            <li class="breadcrumb-item">#1 | Mustermann, Max | 60 Jahre | Männlich </li>
          </ol>
        </nav>
        <div class="nav-buttons">
          <a class="btn btn-secondary" data-controller="modal-form" href="/patients/1/messages/new" data-remote="true"><i class="fas fa-envelope "></i>
            Nachricht schreiben
          </a>
          <a class="btn btn-secondary ml-2" data-controller="modal-form" href="/patients/1/measurements/new" data-remote="true"><i class="fas fa-stethoscope "></i>
            Messung anfordern
          </a>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12 col-xl-9">
          <div className="card">
            <div className="card-header">
              <h6 className="card-header-title">Patienten</h6>
            </div>
            <div className="card-body">

              <div className="d-flex justify-content-between">
                <div>
                  <span className="mr-1"></span>
                </div>
                <div className="d-flex justify-content-end align-items-center mb-2">
                </div>
              </div>

              <div style={{overflowX: 'auto'}}>
                <table className="table">
                  <thead>
                    <tr>
                      <th>
                        A
                      </th>
                      <th>
                        B
                      </th>
                      <th>
                        C
                      </th>
                      <th>
                        D
                      </th>
                      <th>
                        E
                      </th>
                      <th>
                        F
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        A value
                      </td>
                      <td>
                        B value
                      </td>
                      <td>
                        C value
                      </td>
                      <td>
                        D value
                      </td>
                      <td>
                        E value
                      </td>
                      <td>
                        F value
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>

            </div>
          </div>
        </div>

        <div class="col-lg-3">
          <div class="card mb-4">
            <form>
            <div class="card">
              <div class="card-header">
                <div class="card-header-title">Filter</div>
              </div>
              <div class="card-body">
                <div class="form-group">
                  <label for="Datumsbereich">Datumsbereich</label>
                  <input class="form-control" placeholder="Wählen Sie einen Datumsbereich" value="28.02.2022 - 14.03.2022" autocomplete="off" data-controller="date-range" data-min-date="2020-08-07T00:00:00+00:00" type="text" name="daterange" id="daterange" />
                </div>
                <div class="form-group">
                  <label for="Art">Art</label>
                  <select class=" custom-select" name="type" id="type">
                    <option value="">Alle</option>
                    <option value="blood_pressure">Blutdruck</option>
                    <option value="heart_rate">Herzfrequenz</option>
                    <option value="weight">Gewicht</option>
                    <option value="temperature">Temperatur</option>
                    <option value="oxygen_saturation">Sauerstoffsättigung</option>
                    <option value="survey">Fragebogen</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="Zustand">Zustand</label>
                  <select class=" custom-select" name="state" id="state">
                    <option value="">Alle</option>
                    <option value="critical">Kritisch</option>
                    <option value="fair">Ausreichend</option>
                    <option value="good">Gut</option>
                  </select>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </>
  )
}

export default StyleExampleOne;
