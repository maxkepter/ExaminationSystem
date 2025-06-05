package model.exam.student;

import java.util.List;
import java.util.Map;

import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;
import jakarta.ws.rs.core.GenericType;

@Converter
public class StudentChoiceConverter implements AttributeConverter<Map<Integer, List<Integer>>, String> {

    private static final Jsonb jsonb = JsonbBuilder.create();

    @Override
    public String convertToDatabaseColumn(Map<Integer, List<Integer>> attribute) {
        return jsonb.toJson(attribute);
    }

    @Override
    public Map<Integer, List<Integer>> convertToEntityAttribute(String dbData) {
        return jsonb.fromJson(dbData, new GenericType<>() {
        }.getType());
    }
}
