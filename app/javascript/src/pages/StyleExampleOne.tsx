import React from 'react';
import { Inertia } from "@inertiajs/inertia";
import TableNav from '../../components/shared/TableNav'
import FilterNav from '../../components/shared/FilterNav'
import HeaderNav from '../../components/shared/HeaderNav'

const StyleExampleOne = ({name}) => {
  return (
    <>
      <div className="row">
        <FilterNav />
      </div>
    </>
  )
}

export default StyleExampleOne;
