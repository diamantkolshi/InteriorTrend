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
  const { form_options }: any = usePage().props

  function handleChange(e, multiselect) {
    const {name, value} = e.currentTarget;
    
    if(!multiselect) {
      onChange({...ingredient, [name]: value})
  } else {
      const arr = ingredient[name]
      const arrValue = parseInt(value)
      if (!arr.includes(arrValue)) {        
        arr.push(arrValue);              
      } else  {
        arr.splice(arr.indexOf(arrValue), 1); 
      }

      onChange({...ingredient, [name]: arr})
    }
  }

  const errors = useErrors('ingredient');

  function displayDropdownField(field, placeholder, options, multiselect = false) {  

    return (
      <CFormGroup tag={CustomInput}
                  label={tp(field)}
                  error={errors && errors[field]}
                  {...{type: "select", id: field, multiple: multiselect}}
                  value={ingredient && ingredient[field] || ''}
                  onChange={(e) => handleChange(e, multiselect)}>
          {!multiselect && <option value="">{placeholder}</option>}
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
      <Row form>
        <Col md={8}>
          <CFormGroup tag={Input}
                      label={tp('name')}
                      error={errors.name}
                      {...{type: "input", id: 'name'}}
                      value={ingredient && ingredient['name']}
                      placeholder=""
                      onChange={handleChange}
                      />
        </Col>
        <Col md={3}> 
          <CFormGroup tag={Input}
                      label={tp('price')}
                      error={errors.price}
                      {...{type: "number", id: 'price'}}
                      value={ingredient && ingredient['price']}
                      placeholder=""
                      onChange={handleChange}
                      />
        </Col>
        <Col md={1} style={{marginTop: 38}}>
          EUR
        </Col> 
      </Row>
      <Row form>
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
      <Row form>
        <Col md={4}>
          {displayDropdownField('color_ids', 'Zgjidhni stilin', form_options.colors, true)}
        </Col>
        <Col md={4}>
          {displayDropdownField('material_ids', 'Zgjidhni formen', form_options.materials, true)}
        </Col>
      </Row>
    </div>
  )
}

export default IngredientForm;
