import React, { useEffect, useState } from 'react';
import {
    Col,
    CustomInput,
    Input,
    Row
} from 'reactstrap';
import { usePage } from "@inertiajs/inertia-react";
import { useFormState } from 'react-use-form-state';
import CFormGroup from "../../../shared/CFormGroup";
import ImageDisplay from "../../../shared/ImageDisplay";
import useErrors from "../../../shared/useErrors";
import { withScope } from "../../../shared/i18n";

const tp = withScope('activerecord', 'attributes', 'ingredient');
const Textarea = 'textarea';

const IngredientForm = ({ingredient, onChange, newMode = false}) => {
  const {form_options} = usePage();
  
  const [formConfig, {text, select, date, number}] = useFormState({
    ...ingredient
  }, {
    withIds: true, // enable automatic creation of id and htmlFor props
    onChange: (e, stateValues, nextStateValues) => {
      onChange(nextStateValues);
    }
  });

  function handleChange(e) {
    const {name, value} = e.currentTarget;

    onChange({...ingredient, [name]: value})
  }

  const errors = useErrors('project');

  useEffect(() => {
    Object.keys(ingredient).forEach((key) => {
        formConfig.setField(key, ingredient[key]);
    });
  }, [ingredient])

  function displayDropdownField(field, placeholder, options) {
    return (
      <CFormGroup tag={CustomInput}
                  label={tp(field)}
                  error={errors && errors[field]}
                  {...{type: "select", id: field}}>
          <option value="">{placeholder}</option>
          {
            options.map((option, i) => (
                <option key={option.id} value={option.id}>{option.name}</option>
            ))
          }
      </CFormGroup>
    )
  }

  return (
    <div>
      <Row>
        <Col md={7}>
          <CFormGroup tag={Input}
                      label={tp('name')}
                      error={errors.name}
                      placeholder=""
                      {...text('name')}
                      />
        </Col>
        <Col> 
          <CFormGroup tag={Input}
                      label={tp('price')}
                      error={errors.price}
                      placeholder=""
                      {...text('price')}
                      />
        </Col>
      </Row>
      <Row>
        <Col md={4}>
          {displayDropdownField('style_id', 'Zgjidhni stilin', form_options.styles)}
        </Col>
        <Col md={4}>
          {displayDropdownField('form_id', 'Zgjidhni formen', form_options.forms)}
        </Col>
        <Col md={4}>
          {displayDropdownField('category_id', 'Zgjidhni kategorine', form_options.categories)}
        </Col>
      </Row>
    </div>
  )
}

export default IngredientForm;
