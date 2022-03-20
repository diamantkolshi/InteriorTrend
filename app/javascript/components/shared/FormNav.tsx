import React from 'react';
import { Inertia } from "@inertiajs/inertia";

const FormNav = ({name}) => {
  return (
    <div className="col-md-12 col-xl-9">
      <form
        acceptCharset="UTF-8"
        action="/patients/1"
        data-remote="true"
        method="post">
        <input
          name="_method"
          type="hidden"
          value="put"
          />
        <input
          name="authenticity_token"
          type="hidden"
          value="tEH5MLSl7JZSXwmQ7Lm413qBKPyOlcp/nhJ9V1A/rfWpOCOkVYyLklfqZ8UEGh/LEbjJje9ECBwk5onpYp1ifA=="
          />
        <div className="card mb-3">
          <div className="card-header"><div className="card-header-title">Stammdaten</div></div>

          <div className="card-body">
            <div className="row mb-2">
              <div className="col-md-3"><legend>Persönliche Daten</legend></div>

              <div className="col-md-9 col-xl-6">
                <div className="form-row">
                  <div className="col-md-2">
                    <div className="form-group">
                      <label htmlFor="patient_id">Id</label>

                      <input
                        id="patient_id"
                        className=" form-control"
                        name="patient[id]"
                        type="text"
                        value="1"
                        />
                    </div>
                  </div>

                  <div className="col-md-10">
                    <div className="form-group">
                      <label htmlFor="patient_email">E-Mail-Adresse</label>

                      <input
                        id="patient_email"
                        className=" form-control"
                        name="patient[email]"
                        type="text"
                        value="patient@procarement.com"
                        />
                    </div>
                  </div>

                  <div className="col-md-6">
                    <div className="form-group">
                      <label htmlFor="patient_company">Firma</label>

                      <input
                        id="patient_company"
                        className=" form-control"
                        name="patient[company]"
                        type="text"
                        />
                    </div>
                  </div>

                  <div className="col-md-6">
                    <div className="form-group">
                      <label htmlFor="patient_category">Typ</label>

                      <select
                        id="patient_category"
                        className=" custom-select"
                        name="patient[category]">
                        <option value="patient">
                          Patient
                        </option>

                        <option value="doctor">Arzt</option>

                        <option value="industry">Industrie</option>

                        <option value="authority">Behörde</option>

                        <option value="procarement">ProCarement</option>
                      </select>
                    </div>
                  </div>

                  <div className="col">
                    <div className="form-group">
                      <label htmlFor="patient_firstname">Vorname</label>

                      <input
                        id="patient_firstname"
                        className=" form-control"
                        name="patient[firstname]"
                        type="text"
                        value="Max"
                        />
                    </div>
                  </div>

                  <div className="col">
                    <div className="form-group">
                      <label htmlFor="patient_surname">Nachname</label>

                      <input
                        id="patient_surname"
                        className=" form-control"
                        name="patient[surname]"
                        type="text"
                        value="Mustermann"
                        />
                    </div>
                  </div>
                </div>

                <div className="form-group">
                  <label htmlFor="patient_gender">Geschlecht</label>

                  <select
                    id="patient_gender"
                    className=" custom-select"
                    name="patient[gender]">
                    <option
                      value="male">
                      Männlich
                    </option>

                    <option value="female">Weiblich</option>

                    <option value="diverse">Divers</option>
                  </select>
                </div>

                <div className="form-row">
                  <div className="col">
                    <div className="form-group">
                      <label htmlFor="patient_height">Größe</label>

                      <div className="input-group">
                        <input
                          id="patient_height"
                          className=" form-control"
                          name="patient[height]"
                          type="number"
                          step="1"
                          value="170"
                          />
                        <div className="input-group-append">
                          <div className="input-group-text">cm</div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div className="col">
                    <div className="form-group">
                      <label htmlFor="patient_weight">Normalgewicht</label>

                      <div className="input-group">
                        <input
                          id="patient_weight"
                          className=" form-control"
                          name="patient[weight]"
                          type="number"
                          step="0.1"
                          value="80.0"
                          />
                        <div className="input-group-append">
                          <div className="input-group-text">kg</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="form-group">
                  <label htmlFor="patient_birthdate">Geburtsdatum</label>

                  <div
                    className="d-flex justify-content-between"
                    data-controller="birthday-selector">
                    <select
                      id="patient_birthdate_3i"
                      className="custom-select"
                      name="patient[birthdate(3i)]"
                      style={{maxWidth: '30%'}}>
                      <option value="1">1</option>

                      <option value="2">2</option>

                      <option value="3">3</option>

                      <option value="4">4</option>

                      <option value="5">5</option>

                      <option value="6">6</option>

                      <option value="7">7</option>

                      <option value="8">8</option>

                      <option
                        value="9">
                        9
                      </option>

                      <option value="10">10</option>
                    </select>
                  </div>
                </div>

                <div className="form-row">
                  <div className="col">
                    <div className="form-group">
                      <div className="form-group">
                        <label htmlFor="patient_relationship_status">Beziehungsstatus</label>

                        <select
                          id="patient_relationship_status"
                          className="custom-select"
                          name="patient[relationship_status]">
                          <option value="inbaskadk">Unbekannt</option>

                          <option value="inrelation">In einer Beziehung</option>

                          <option value="single">Alleinstehend</option>

                          <option value="widowed">Verwitwet</option>

                          <option value="married">Verheiratet</option>
                        </select>
                      </div>
                    </div>
                  </div>

                  <div className="col">
                    <div className="form-group">
                      <div className="form-group">
                        <label htmlFor="patient_smoking_type">Raucher</label>

                        <select
                          id="patient_smoking_type"
                          className=" custom-select"
                          name="patient[smoking_type]">
                          <option value="Unbekannt">Unbekannt</option>

                          <option value="none">Nein</option>

                          <option value="smoker">Ja</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div className="row mb-2">
              <div className="col-md-3"><legend>Kontaktdaten</legend></div>

              <div className="col-md-9 col-xl-6">
                <div className="form-row">
                  <div className="col">
                    <div className="form-group">
                      <label htmlFor="patient_addresses_street">Straße und Hausnummer</label>

                      <input
                        id="patient_addresses_street"
                        className=" form-control"
                        name="patient[addresses][street]"
                        type="text"
                        />
                    </div>

                    <div className="form-group">
                      <label htmlFor="patient_addresses_street_2">Adresszusatz</label>

                      <input
                        id="patient_addresses_street_2"
                        className=" form-control"
                        name="patient[addresses][street_2]"
                        type="text"
                        />
                    </div>
                  </div>
                </div>

                <div className="form-row">
                  <div className="col-3">
                    <div className="form-group">
                      <label htmlFor="patient_addresses_zip_code">PLZ</label>

                      <input
                        id="patient_addresses_zip_code"
                        className="form-control"
                        name="patient[addresses][zip_code]"
                        type="text"
                        />
                    </div>
                  </div>

                  <div className="col-9">
                    <div className="form-group">
                      <label htmlFor="patient_addresses_city">Stadt</label>

                      <input
                        id="patient_addresses_city"
                        className=" form-control"
                        name="patient[addresses][city]"
                        type="text"
                        />
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div className="row">
              <div className="col-md-3"><legend>Telefonnummern</legend></div>

              <div className="col-md-9 col-xl-6">
                <div
                  className="mb-3"
                  data-controller="list">
                  <div data-list-target="container">
                    <div className="form-group">
                      <div className="form-row">
                        <div className="col">
                          <div className="input-group">
                            <input
                              id="patient_phone_numbers__number"
                              className=" form-control"
                              name="patient[phone_numbers][][number]"
                              type="text"
                              />
                            <select
                              id="patient_phone_numbers__type"
                              className="input-group-prepend col-4 custom-select"
                              name="patient[phone_numbers][][type]">
                              <option
                                value="home">
                                Zuhause
                              </option>

                              <option value="work">Arbeit</option>

                              <option value="mobile">Mobil</option>
                            </select>
                          </div>
                        </div>

                        <div className="col-2 ml-2 text-right" />
                      </div>

                      <div className="invalid-feedback d-block" />
                    </div>
                  </div>

                  <button
                    className="btn-sm btn btn-link"
                    data-action="list#onAdd"
                    type="button">
                    + Telefonnr. hinzufügen
                  </button>

                  <template data-list-target="template" />
                </div>
              </div>
            </div>

            <div className="row">
              <div className="col-md-3"><legend>Versicherer</legend></div>

              <div className="col-md-9 col-xl-6">
                <div className="form-group">
                  <label htmlFor="patient_insurance_company">Versicherer</label>

                  <input
                    id="patient_insurance_company"
                    className=" form-control"
                    name="patient[insurance_company]"
                    type="text"
                    />
                </div>

                <div className="form-group">
                  <label htmlFor="patient_insurance_number">Versichertennummer</label>

                  <input
                    id="patient_insurance_number"
                    className=" form-control"
                    name="patient[insurance_number]"
                    type="text"
                    />
                </div>
              </div>
            </div>

            <div className="row">
              <div className="col-md-3"><legend>Notfalldaten</legend></div>

              <div className="col-md-9 col-xl-6">
                <div className="form-group">
                  <div className="form-group">
                    <label htmlFor="patient_blood_group">Blutgruppe</label>

                    <select
                      id="patient_blood_group"
                      className=" custom-select"
                      name="patient[blood_group]">
                      <option value="Unbekannt">Unbekannt</option>

                      <option value="a+">A+</option>

                      <option value="a-">B+</option>

                      <option value="b+">B+</option>

                      <option value="b-">B-</option>

                      <option value="0+">0+</option>

                      <option value="0-">0-</option>

                      <option value="ab+">AB+</option>

                      <option value="ab-">AB-</option>
                    </select>
                  </div>
                </div>

                <div className="form-group">
                  <label htmlFor="patient_allergies">Allergien, Intoleranzen</label>

                  <div className="input-group">
                    <textarea
                      id="patient_allergies"
                      className=" form-control"
                      name="patient[allergies]"
                      />
                  </div>
                </div>

                <div className="form-group">
                  <label htmlFor="patient_implants">Implantate</label>

                  <div className="input-group">
                    <textarea
                      id="patient_implants"
                      className=" form-control"
                      name="patient[implants]"
                      />
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div className="card-footer justify-content-between d-flex">
            <input
              className="ml-auto btn btn-primary"
              color="primary"
              name="commit"
              type="submit"
              value="Speichern"
              data-disable-with="Speichern"
              />
          </div>
        </div>
      </form>
    </div>
  )
}

export default FormNav;
