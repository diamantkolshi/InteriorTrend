import React from 'react';
import { Inertia } from "@inertiajs/inertia";
import {
    Button,
} from 'reactstrap';

const TableNav = ({title, rows, action}) => {

  const truncate = (str, n) => {
		return str?.length > n ? `${str.substr(0, n - 1)  }...` : str;
	};

  const myFunction = () => {
    if (window.confirm("Press a button!") === true) {
       alert("You pressed OK!");
     } else {
       alert("You canceled!");
     }
  }

  const addNew = () => {
    Inertia.visit(`/projects/new`, {preserveScroll: true})
  }

  return (
    <div className="col-md-12 col-xl-9">
      <div className="card">
        <div className="card-header">
          <h6 className="card-header-title">{title}</h6>
        </div>
        <div className="card-body">

          <div className="d-flex justify-content-between">
            <div>
              <span className="mr-1">
                { action &&
                  <Button color="primary" onClick={() => addNew()} className="mr-2">
                      <i className="fas fa-plus fa-sm" />{' '}
                      Patient importieren
                  </Button>
                }
              </span>
            </div>
            <div className="d-flex justify-content-end align-items-center mb-2" />
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
                  <tr key={row.title}>
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
                    <td className="text-left">
                      <a className="btn btn-primary btn-sm mr-2" href="/#">
                        <i className="fas fa-edit fa-sm" />
                      </a>
                      <Button color="danger" onClick={() => myFunction()} className="mr-2 btn-sm">
                          <i className="fas fa-trash fa-sm" />
                      </Button>
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
