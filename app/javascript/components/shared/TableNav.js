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
              <span class="mr-1">
                <a size="sm" icon="plus" color="primary" data-controller="modal-form" data-toggle="tooltip" class="btn btn-primary btn-sm " data-method="get" href="/patients/1/documents/new" data-remote="true" data-original-title="" title="">
                  <i class="fas fa-plus fa-sm mr-1"></i>
                  Create new project
                </a>
              </span>
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
                    <td class="text-left">
                      <a size="sm" icon="edit" color="primary" data-controller="modal-form" data-toggle="tooltip" class="btn btn-primary btn-sm mr-2" data-method="get" href="/patients/1/medical_contacts/1/edit" data-remote="true" data-original-title="" title="">
                        <i class="fas fa-edit fa-sm"></i>
                      </a>
                      <a size="sm" icon="trash" color="danger" data-confirm="Sind Sie sicher?" data-toggle="tooltip" class="btn btn-danger btn-sm " data-remote="true" rel="nofollow" data-method="delete" href="/patients/1/medical_contacts/1" data-original-title="" title="">
                        <i class="fas fa-trash fa-sm"></i>
                      </a>
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
