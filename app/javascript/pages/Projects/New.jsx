import React from 'react';
import { Inertia } from "@inertiajs/inertia";
import TableNav from '../../components/shared/TableNav'
import FilterNav from '../../components/shared/FilterNav'
import HeaderNav from '../../components/shared/HeaderNav'

const StyleExampleOne = ({projects}) => {
  return (
    <>
      <div id="content-top-bar">
        <nav>
          <ol className="breadcrump breadcrumb-title">
            <li className="breadcrumb-item">New project</li>
          </ol>
        </nav>
        <div className="nav-buttons">
        </div>
      </div>
      <div className="row">
        <TableNav
          title={"New project"}
          rows={[]}
        />
        <FilterNav />
      </div>
    </>
  )
}

export default StyleExampleOne;
