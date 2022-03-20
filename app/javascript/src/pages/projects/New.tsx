import React from 'react';
import { Inertia } from "@inertiajs/inertia";
import {
    Modal
} from 'reactstrap';

const New = ({projects, isOpen, toggleModal}) => {
  return (
    <Modal isOpen={isOpen} size="lg" toggle={() => toggleModal()}>
      <div className="modal-dialog">
        <div className="modal-content">
          <form
            action="/patients/1/documents"
            method="post">
            <input
              name="authenticity_token"
              type="hidden"
              value="ydXnksgeO9TcUAHGRwlqYyDpgoXt3UhHod6FigxmVPOqHr+F0r5jSw7hVk5G1dvURVyWv+LSzLWGEuKZcBb/gQ=="
              />
            <div className="modal-header">
              Dokument hinzufügen

              <button
                className="close"
                type="button"
                data-dismiss="modal"
                aria-label="close">
                <span>×</span>
              </button>
            </div>

            <div className="modal-body">
              <div className="form-group">
                <label>Dateien</label>

                <div className="input-group">
                  <div className="custom-file">
                    <input
                      id="document_files"
                      className="custom-file-input"
                      accept="application/pdf,image/*"
                      name="document[files][]"
                      data-controller="file-input"
                      type="file"
                      />
                    <label className="custom-file-label" />
                  </div>
                </div>
              </div>

              <div className="form-group">
                <label>Beschreibung</label>

                <input
                  id="document_description"
                  className=" form-control"
                  name="document[description]"
                  type="text"
                  />
              </div>

              <div className="form-group">
                <label>Erstellungsdatum</label>

                <input
                  id="document_original_date"
                  className="form-control form-control"
                  autoComplete="off"
                  name="document[original_date]"
                  data-controller="single-date"
                  type="text"
                  value="2022-03-18T00:00:00+00:00"
                  />
              </div>

              <div className="form-group">
                <label>Kategorie</label>

                <select
                  id="document_category"
                  className=" custom-select"
                  name="document[category]">
                  <option value="report_ambulant">Arztbrief</option>
                  <option value="imaging">Bildgebung</option>
                  <option value="ecg">EKG</option>
                  <option value="questionnaire">Fragebogen</option>
                </select>
              </div>
            </div>

            <div className="modal-footer">
              <input
                className=" btn btn-primary"
                color="primary"
                name="commit"
                type="submit"
                value="Speichern"
                data-disable-with="Speichern"
                />
            </div>
          </form>
        </div>
      </div>
    </Modal>
  )
}

export default New;
