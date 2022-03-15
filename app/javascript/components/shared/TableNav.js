import React from 'react';
import { Inertia } from "@inertiajs/inertia";

const TableNav = ({name}) => {
  return (
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
  )
}

export default TableNav;
