import React from 'react';
import { Inertia } from "@inertiajs/inertia";

const TableNav = ({rows}) => {

  const truncate = (str, n) => {
		return str?.length > n ? str.substr(0, n - 1) + "..." : str;
	};

  return (
    <div className="col-md-12 col-xl-9">
      <div className="card">
        <div className="card-header">
          <h6 className="card-header-title">Projects</h6>
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
                  <th style={{width: '20px'}}>
                    Title
                  </th>
                  <th style={{width: '25px'}}>
                    Description
                  </th>
                  <th>
                    City
                  </th>
                  <th>
                    Street
                  </th>
                  <th>
                    Location
                  </th>
                  <th>
                    Views
                  </th>
                  <th>
                    #
                  </th>
                </tr>
              </thead>
              <tbody>
                {rows.map((row) => (
                  <tr>
                    <td>
                      {row.title}
                    </td>
                    <td>
                      {truncate(row.description, 40)}
                    </td>
                    <td>
                      {row.city.name}
                    </td>
                    <td>
                      {row.street}
                    </td>
                    <td>
                      {row.location}
                    </td>
                    <td>
                      {row.views}
                    </td>
                    <td>
                      #
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  )
}

export default TableNav;
