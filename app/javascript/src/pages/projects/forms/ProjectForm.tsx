import React, { useEffect } from 'react';
import {
    Col,
    CustomInput,
    Input,
    Row
} from 'reactstrap';
import { useFormState } from 'react-use-form-state';
import { Inertia } from "@inertiajs/inertia";
import CFormGroup from "../../../shared/CFormGroup";
import useErrors from "../../../shared/useErrors";

const Textarea = 'textarea';

const ProjectForm = ({project, onChange, newMode = false}) => {
  const [formConfig, {text, select, date, number}] = useFormState({
    ...project
  }, {
    withIds: true, // enable automatic creation of id and htmlFor props
    onChange: (e, stateValues, nextStateValues) => {
        onChange(nextStateValues);
    }
  });

  const errors = useErrors('project');

  useEffect(() => {
    Object.keys(project).forEach((key) => {
        formConfig.setField(key, project[key]);
    });
  }, [project])

  function updateProject(key, value) {
    onChange({...formConfig.values, [key]: value})
  }

  return (
    <div>
      <Row>
        <Col md={3}>
            <legend>Project info</legend>
        </Col>
        <Col md={9} xl={8}>
          <Row form>
            <Col>
              <CFormGroup tag={Input}
                          label={'Title'}
                          error={errors.title}
                          placeholder=""
                          {...text('surname')}
                          />
            </Col>
          </Row>
          <Row form>
            <Col>
              <CFormGroup tag={Textarea}
                          label={"Description"}
                          error={errors.description}
                          placeholder=""
                          {...text('description')}
                          />
            </Col>
          </Row>
        </Col>
      </Row>
    </div>
  )
}

export default ProjectForm;
