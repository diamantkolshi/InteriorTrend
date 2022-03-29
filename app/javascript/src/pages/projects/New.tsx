import React, { useState } from 'react';
import { Inertia } from "@inertiajs/inertia";
import { Modal, Button, Form, ModalBody, ModalFooter, ModalHeader } from "reactstrap";
import CardFormModal from "../../shared/CardFormModal";
import useErrors from "../../shared/useErrors";
import ProjectForm from "./forms/ProjectForm";
import { withScope } from "../../shared/i18n";

const ttable = withScope('helpers', 'project', 'new', 'table');

const New = ({project, isOpen, toggleModal, cities}) => {
  const [projectValues, setProjectValues] = useState(project);

  function handleSubmit() {
    Inertia.post('/projects', {
      project: projectValues
    }, {preserveState: true});
  }

  function handleChange(update) {
    setProjectValues(update);
  }

  return (
    <div>
      <Modal isOpen={isOpen} size="lg" toggle={() => toggleModal()}>
        <CardFormModal onSubmit={handleSubmit} title={ttable('new_project')} errors={useErrors('project')} toggleModal={toggleModal}>
          <ProjectForm
            project={projectValues}
            cities={cities}
            onChange={handleChange}
          />
        </CardFormModal>
      </Modal>
    </div>
  )
}

export default New;
