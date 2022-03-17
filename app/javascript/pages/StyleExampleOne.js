import React from 'react';
import { Inertia } from "@inertiajs/inertia";
import TableNav from '../components/shared/TableNav'
import FilterNav from '../components/shared/FilterNav'
import HeaderNav from '../components/shared/HeaderNav'

const StyleExampleOne = ({name}) => {
  return (
    <>
      <HeaderNav />

      <div className="row">
        <TableNav />
        <FilterNav />
      </div>
    </>
  )
}

export default StyleExampleOne;
