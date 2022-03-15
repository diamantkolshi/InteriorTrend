import React from 'react';
import { Inertia } from "@inertiajs/inertia";
import TableNav from '../../components/shared/TableNav'
import FilterNav from '../../components/shared/FilterNav'
import HeaderNav from '../../components/shared/HeaderNav'

const StyleExampleOne = ({projects}) => {
  return (

    <>
      {projects.map((project, i) => (
        <p key={i}>
          return {project.title}
        </p>
      ))}
      <HeaderNav />

      <div class="row">
        <TableNav />
        <FilterNav />
      </div>
    </>
  )
}

export default StyleExampleOne;
