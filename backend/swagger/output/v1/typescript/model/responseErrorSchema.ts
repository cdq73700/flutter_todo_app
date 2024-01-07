/**
 * todo API
 * This is todo API
 *
 * OpenAPI spec version: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */
import { ErrorSchema } from './errorSchema';

/**
 * Schema for the response containing error information.
 */
export interface ResponseErrorSchema { 
    success?: boolean;
    error?: ErrorSchema;
}