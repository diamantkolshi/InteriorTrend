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
import { withScope } from "../../shared/i18n";

const ttable = withScope('helpers', 'project', 'index', 'table');

const Edit = ({project, cities, posts}) => {
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
    <ProjectLayout project={project} posts={posts}>
      <Row>
        <Col xl={9}>
          <CardForm onSubmit={handleSubmit} title={ttable('edit_project')} errors={useErrors('project')}>
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
