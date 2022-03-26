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

const ProjectForm = ({project, cities, onChange, newMode = false}) => {
  const [formConfig, {text, select, date, number}] = useFormState({
    city_id: 1,
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
                          {...text('title')}
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
          <CFormGroup tag={CustomInput}
                      label={"City"}
                      error={errors.city}
                      {...select('city_id')}
                      type="select">
                <option value="">Choose city</option>
                {
                  cities.map((city, i) => (
                      <option key={city.id} value={city.id}>{city.name}</option>
                  ))
                }
          </CFormGroup>
          <Row form>
              <Col>
                <CFormGroup tag={Input}
                            label={'Street'}
                            error={errors.street}
                            placeholder=""
                            {...text('street')}
                            />
              </Col>
              <Col>
                <CFormGroup tag={Input}
                            label={'Location'}
                            error={errors.location}
                            placeholder=""
                            {...text('location')}
                            />
              </Col>
          </Row>
        </Col>
      </Row>
    </div>
  )
}

export default ProjectForm;
