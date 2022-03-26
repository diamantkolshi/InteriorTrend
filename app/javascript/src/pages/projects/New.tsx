import React, { useState } from 'react';
import { Inertia } from "@inertiajs/inertia";
import { Modal, Button, Form, ModalBody, ModalFooter, ModalHeader } from "reactstrap";
import CardFormModal from "../../shared/CardFormModal";
import useErrors from "../../shared/useErrors";
import ProjectForm from "./forms/ProjectForm";

const New = ({project, isOpen, toggleModal, cities}) => {
  const [projectValues, setProjectValues] = useState(project);

  function handleSubmit() {
    Inertia.post('/projects', {
      project: projectValues
    }, {preserveState: true});
  }

  function handleChange(update) {
    // debugger
    setProjectValues(update);
  }

  return (
    <div>
      <Modal isOpen={isOpen} size="lg" toggle={() => toggleModal()}>
        <CardFormModal onSubmit={handleSubmit} title="New project" errors={useErrors('project')} toggleModal={toggleModal}>
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
