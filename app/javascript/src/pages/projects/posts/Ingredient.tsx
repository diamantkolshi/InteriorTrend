import React, { useState } from 'react';
import { Inertia } from "@inertiajs/inertia";
import { Modal, Button, Form, ModalBody, ModalFooter, ModalHeader } from "reactstrap";
import CardFormModal from "../../../shared/CardFormModal";
import useErrors from "../../../shared/useErrors";
import { withScope } from "../../../shared/i18n";

const ttable = withScope('helpers', 'project', 'new', 'table');

const Ingredient = ({ingredient, isOpen, toggleModal}) => {
  function handleSubmit() {
  }

  return ( 
    <div>
      <Modal isOpen={isOpen} size="lg" toggle={() => toggleModal()} backdrop={'static'}>
        <CardFormModal onSubmit={handleSubmit} title={ttable('Ingredient_project')} errors={useErrors('project')} toggleModal={toggleModal}>
        </CardFormModal>
      </Modal>
    </div>
  )
}

export default Ingredient;
