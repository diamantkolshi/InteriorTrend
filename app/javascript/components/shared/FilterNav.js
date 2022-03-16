import React from 'react';
import { Inertia } from "@inertiajs/inertia";

const FilterNav = ({name}) => {
  return (
    <div className="col-lg-3">
      <div className="card mb-4">
        <form>
          <div className="card">
            <div className="card-header">
              <div className="card-header-title">Filter</div>
            </div>
            <div className="card-body">
              <div className="form-group">
                <label htmlFor="Datumsbereich">Datumsbereich</label>
                <input className="form-control" placeholder="Wählen Sie einen Datumsbereich" defaultValue="28.02.2022 - 14.03.2022" autoComplete="off" data-controller="date-range" data-min-date="2020-08-07T00:00:00+00:00" type="text" name="daterange" id="daterange" />
              </div>
              <div className="form-group">
                <label htmlFor="Art">Art</label>
                <select className=" custom-select" name="type" id="type">
                  <option defaultValue="">Alle</option>
                  <option defaultValue="blood_pressure">Blutdruck</option>
                  <option defaultValue="heart_rate">Herzfrequenz</option>
                  <option defaultValue="weight">Gewicht</option>
                  <option defaultValue="temperature">Temperatur</option>
                  <option defaultValue="oxygen_saturation">Sauerstoffsättigung</option>
                  <option defaultValue="survey">Fragebogen</option>
                </select>
              </div>
              <div className="form-group">
                <label htmlFor="Zustand">Zustand</label>
                <select className=" custom-select" name="state" id="state">
                  <option defaultValue="">Alle</option>
                  <option defaultValue="critical">Kritisch</option>
                  <option defaultValue="fair">Ausreichend</option>
                  <option defaultValue="good">Gut</option>
                </select>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  )
}

export default FilterNav;
