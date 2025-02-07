import { formBindingData, FormExtensionAbility, formInfo, formProvider } from '@kit.FormKit';
import { Want } from '@kit.AbilityKit';

export default class EntryFormAbility extends FormExtensionAbility {
  onAddForm(want: Want) {
    class FormData {
      week:string = getFormattedWeek()
      day: number = getFormattedDay()
    }
    let formData = new FormData()
    return formBindingData.createFormBindingData(formData)
  }
  onCastToNormalForm(formId: string) {
    // Called when the form provider is notified that a temporary form is successfully
    // converted to a normal form.
  }

  onUpdateForm(formId: string) {
    class FormData {
      week: string = getFormattedWeek()
      day: number = getFormattedDay()
    }

    let formData = new FormData()
    let formBinding = formBindingData.createFormBindingData(formData)

    formProvider.updateForm(formId, formBinding).then(() => {
      console.info('Form updated successfully.')
    }).catch((err:Error) => {
      console.error('Failed to update form: ' + JSON.stringify(err))
    })
  }

  onFormEvent(formId: string, message: string) {
    // Called when a specified message event defined by the form provider is triggered.
  }
  onRemoveForm(formId: string) {
    // Called to notify the form provider that a specified form has been destroyed.
  }
  onAcquireFormState(want: Want) {
    // Called to return a {@link FormState} object.
    return formInfo.FormState.READY;
  }
};

function getFormattedWeek(): string {
  const weekDays = ["日", "一", "二", "三", "四", "五", "六"]
  const dayOfWeek = new Date().getDay()
  return `星期${weekDays[dayOfWeek]}`
}

function getFormattedDay(): number {
  const dayOfMonth = new Date().getDate()
  return dayOfMonth
}
