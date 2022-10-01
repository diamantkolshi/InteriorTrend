import React from 'react';
import HeaderNav from '../../components/shared/HeaderNav'
import ManuNav from '../../components/shared/ManuNav'
import FormNav from '../../components/shared/FormNav'

const StyleExampleOne = () => {
  return (
    <>
      <HeaderNav name="sadas" />

      <div className="row justify-content-between">
        <ManuNav name="sadas" />

        <div className="col-lg-9 col-xl-10">
          <div className="row">

            <FormNav name="sadas" />

            <div className="col-md-5 col-xl-3">
              <div className="card">
                <div className="card-header"><div className="card-header-title">Aktionen</div></div>

                <div className="card-body">
                  <a
                    className="btn btn-danger btn-block"
                    href="/patients/1"
                    data-confirm="Wollen Sie den Patienten 'Max Mustermann' wirklich löschen?"
                    rel="nofollow"
                    data-method="delete">
                    Patient löschen
                  </a>

                  <a
                    className="btn btn-secondary btn-block"
                    href="/patients/1/deactivate"
                    data-confirm="Wollen Sie den Patienten 'Max Mustermann' wirklich deaktivieren?"
                    rel="nofollow"
                    data-method="post">
                    Patient deaktivieren
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  )
}

export default StyleExampleOne;
