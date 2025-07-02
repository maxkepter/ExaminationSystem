package utils;

import java.util.HashMap;
import java.util.Map;

public class FieldValueBuilder {

    private Map<String, Object> fieldValue;

    public FieldValueBuilder() {
        this.fieldValue = new HashMap<>();
    }

    public FieldValueBuilder buildFieldValue(String field, Object value) {
        fieldValue.put(field, value);
        return this;
    }

    public Map<String, Object> build() {
        return fieldValue;
    }
}
