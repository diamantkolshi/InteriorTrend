import React, { useState } from 'react';
import { Inertia } from "@inertiajs/inertia";
import {
    Col,
    CustomInput,
    Input,
    Row
} from 'reactstrap';
import CardFormModal from "../../shared/CardFormModal";
import useErrors from "../../shared/useErrors";
import CardForm from "../../shared/CardForm";
import ProjectForm from "./forms/ProjectForm";
import ProjectLayout from "./Layout";

const Edit = ({project, cities}) => {
  const [projectValues, setProjectValues] = useState(project);

  function handleSubmit() {
    Inertia.put(`/projects/${project.id}`, {
      project: projectValues
    }, {preserveScroll: true, preserveState: true});
  }

  function handleChange(update) {
    setProjectValues(update);
  }

  return (
    <ProjectLayout project={project}>
      <Row>
        <Col xl={10}>
          <CardForm onSubmit={handleSubmit} title="Edit project" errors={useErrors('patient')}>
            <ProjectForm
              project={projectValues}
              cities={cities}
              onChange={handleChange}
            />
          </CardForm>
        </Col>
      </Row>
    </ProjectLayout>
  )
}

export default Edit;
