import React, { useEffect, useState } from 'react';
import { Inertia } from "@inertiajs/inertia";
import { Modal, Button, Form, ModalBody, ModalFooter, ModalHeader } from "reactstrap";
import CardFormModal from "../../../shared/CardFormModal";
import useErrors from "../../../shared/useErrors";
import { withScope } from "../../../shared/i18n";
import IngredientForm from "../forms/IngredientForm";

const ttable = withScope('helpers', 'project', 'new', 'table');

const Ingredient = ({ingredient, isOpen, toggleModal, projectId, postId}) => {
  const [ingredientValues, setIngredientValues] = useState(ingredient);

  useEffect(() => {
    setIngredientValues(ingredient)
  }, [ingredient])

  function handleSubmit() {
    Inertia.post(`/projects/${projectId}/posts/${postId}/ingredients`, {
      ingredient: ingredientValues
    }, {preserveState: true});
  }

  function handleChange(update) {
    setIngredientValues(update)
  }

  return ( 
    <div>
      <Modal isOpen={isOpen} size="lg" toggle={() => toggleModal()} backdrop={'static'}>
        <CardFormModal onSubmit={handleSubmit} title={"Shto perberes te ri"}  errors={useErrors('ingredient')} toggleModal={toggleModal}>
          <IngredientForm
            ingredient={ingredientValues}
            onChange={handleChange}
          />
        </CardFormModal>
      </Modal>
    </div>
  )
}

export default Ingredient;
