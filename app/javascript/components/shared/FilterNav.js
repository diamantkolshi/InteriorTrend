import React from 'react';
import { Inertia } from "@inertiajs/inertia";

const FilterNav = ({name}) => {
  return (
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
  )
}

export default FilterNav;
